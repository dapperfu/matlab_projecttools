package_folder = 'prjtools';

% Method 1
% matlab.tbxpkg.internal.create(package_folder);

service = com.mathworks.toolbox_packaging.services.ToolboxPackagingService;

project_key = service.createNewProject(fullfile(pwd, package_folder));

service.saveAs(project_key, fullfile(pwd, [package_folder '2.prj']))

service.setToolboxRoot(project_key, package_folder);

service.setAuthorName(project_key, 'Frey, Jed');
service.setDescription(project_key, 'Description');

toolboxDependencies = matlab.depfun.internal.DependencyFormatter.toolboxPackagingDependencies(package_folder, []);

service.packageProject(project_key)
