# frozen_string_literal: true

module PaginationPatchHelper
  def render_pagination
    build_pagination_links @paginator do |parameters|
      if att = @attachments[parameters[:page] - 1]
        named_attachment_path(att, att.filename)
      end
    end if @paginator
  end

  # Yields the given block with the text and parameters
  # for each pagination link and returns a string that represents the links
  def build_pagination_links(paginator, count=nil, options={}, &block)
    options.assert_valid_keys :per_page_links

    per_page_links = options.delete(:per_page_links)
    per_page_links = false if count.nil?
    page_param = paginator.page_param
    items = []

    if paginator.multiple_pages?
      text = "\xc2\xab " + l(:label_previous)

      if paginator.previous_page
        items << { content: text, url: yield({ page_param => paginator.previous_page }), options: { accesskey: accesskey(:previous) }
        }
      else
        items << { content: text, options: { disabled: true } }
      end
    end

    previous = nil
    paginator.linked_pages.each do |page|
      if previous && previous != page - 1
        items << { content: '&hellip;'.html_safe, options: { disabled: true } }
      end

      if page == paginator.page
        items << { content: page.to_s, options: { current: true } }
      else
        items << { content: page.to_s, url: yield({ page_param => page }) }
      end

      previous = page
    end

    if paginator.multiple_pages?
      text = l(:label_next) + " \xc2\xbb"

      if paginator.next_page
        items << { content: text, url: yield({ page_param => paginator.next_page }), options: { accesskey: accesskey(:next) } }
      else
        items << { content: text, options: { disabled: true } }
      end
    end

    html = page_pagination(items, class: 'mb-0')

    info = ''.html_safe
    info << content_tag('span', "(#{paginator.first_item}-#{paginator.last_item}/#{paginator.item_count})") + ' '
    info << content_tag('span', links.to_s) if per_page_links != false && links = per_page_links(paginator, &block)

    html << content_tag('span', info)
    html.html_safe
  end
end

AttachmentsHelper.send(:prepend, PaginationPatchHelper)