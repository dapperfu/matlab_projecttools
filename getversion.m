function varargout=getversion(varargin)

%% Input Processing
% Check the number of input & outputs.
narginchk(0, 1);
nargoutchk(0, 4);

if nargin==1
    project = varargin{1};
else
    % Get all projects in the current directory.
    project = dir(fullfile(pwd, '*.prj'));
    % If there is more than one project, throw an error.
    if len(project)>1
        error('GETVER:TOOMANY', 'More than one project found in the current directory. Project must be explicitly defined')
    else
        % Otherwise use the project name as the project.
        project = project.name;
    end
end

%% XML processing.

% Read the project file as XML.
DOMnode = xmlread(project);
% Get the root document element.
root = DOMnode.getDocumentElement;
% Find the document node matching tag name 'param.version'.
version_node = root.getElementsByTagName('param.version').item(0);
% Get the node of the value of the param.version tag.
version_value_node = version_node.getChildNodes.item(0);
% Get the version value from the node.
version_value = char(version_value_node.getNodeValue);
% Split the version string into major, minor, bug & build parts.
version_split = strsplit(version_value, '.');
% Convert each of those parts to an integer.
version_split_n = cellfun(@str2double, version_split);

if nargout == 0
    fprintf('%s v%s\n',project, version_value);
    return
elseif nargout==1
    varargout{1} = version_value;
    return
else
    varargout = cell(1, nargout);
    for idx = 1:numel(version_split_n)
       varargout{idx} = version_split_n(idx);
    end
end
