module Controllers
  module ProjectsPatchController
  end
end

ProjectsController.send(:prepend, Controllers::ProjectsPatchController)