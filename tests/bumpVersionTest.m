%% Main function to generate tests
function tests = bumpVersionTest
tests = functiontests(localfunctions);
end

%% Test Functions
function testBumpVersion1(testCase)
%% Test bump version by itself, with no input arguments.
ver = bumpversion;
assert(strcmp(ver, '1.0.0.1'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.0.1'));
end

function testBumpVersion2(testCase)
ver = bumpversion(testCase.TestData.prj);

assert(strcmp(ver, '1.0.0.1'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.0.1'));
end

%% Bump Major Version
function testBumpVersionMajor(testCase)
ver = bumpversion('major');

assert(strcmp(ver, '2.0.0.0'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '2.0.0.0'));
end

function testBumpVersionMajor2(testCase)
ver = bumpversion(testCase.TestData.prj, 'major');

assert(strcmp(ver, '2.0.0.0'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '2.0.0.0'));
end

%% Bump Minor Version
function testBumpVersionMinor(testCase)
ver = bumpversion('minor');
expected = '1.1.0.0';

assert(strcmp(ver, expected), 'Expected %s got %s', expected, ver);

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, expected));
end

function testBumpVersionMinor2(testCase)
ver = bumpversion(testCase.TestData.prj, 'minor');

expected = '1.1.0.0';

assert(strcmp(ver, expected), 'Expected %s got %s', expected, ver);

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, expected));
end

%% Bump Bug Version
function testBumpVersionBug(testCase)
ver = bumpversion('bug');

assert(strcmp(ver, '1.0.1.0'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.1.0'));
end

function testBumpVersionBug2(testCase)
ver = bumpversion(testCase.TestData.prj, 'bug');

assert(strcmp(ver, '1.0.1.0'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.1.0'));
end

%% Bump Build Version
function testBumpVersionBuild(testCase)
ver = bumpversion(testCase.TestData.prj, 'build');

assert(strcmp(ver, '1.0.0.1'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.0.1'));
end

function testBumpVersionBuild2(testCase)
ver = bumpversion(testCase.TestData.prj, 'build');

assert(strcmp(ver, '1.0.0.1'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '1.0.0.1'));
end


function testBumpVersionMultiple(testCase)
ver = bumpversion(testCase.TestData.prj, 'build');
ver = bumpversion(testCase.TestData.prj, 'build');
ver = bumpversion(testCase.TestData.prj, 'build');
ver = bumpversion(testCase.TestData.prj, 'build');

ver = bumpversion(testCase.TestData.prj, 'major');

assert(strcmp(ver, '2.0.0.0'));

service = testCase.TestData.service;
prj = service.openProject(testCase.TestData.prj);
ver = char(service.getVersion(prj));

assert(strcmp(ver, '2.0.0.0'));
end


%% Optional file fixtures  
function setupOnce(testCase)  % do not change function name
%% Add path 
p = fileparts(mfilename('fullpath'));

[~, fa] = fileattrib(fullfile(p, '..', 'prjtools'));
addpath(fa.Name);

end

function teardownOnce(testCase)  % do not change function name
% change back to original path, for example
end

%% Optional fresh fixtures  
function setup(testCase)  % do not change function name
test_project = 'test_project';
try
    delete(fullfile(test_project, '*'));
    rmdir(test_project);
catch    
end

mkdir(test_project);

fid = fopen(fullfile(test_project, 'dummy.m'), 'w');
fprintf(fid, 'function varargout=dummy(varargin)');
fclose(fid);

matlab.tbxpkg.internal.create(test_project);

[~, test_project_attrib] = fileattrib(test_project);

testCase.TestData.project = test_project;
testCase.TestData.prj = [test_project_attrib.Name, '.prj'];
testCase.TestData.service = com.mathworks.toolbox_packaging.services.ToolboxPackagingService;

end

function teardown(testCase)  % do not change function name
test_project = testCase.TestData.project;
try
    delete([test_project, '.*']);
    delete(fullfile(test_project, '*'));
    rmdir(test_project);
catch    
end
end
