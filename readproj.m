function bumpversion(project, varargin{i})

DOMnode = xmlread('junit-xml-ml.prj')
root = DOMnode. getDocumentElement

configuration = root.getElementsByTagName('configuration').item(0)

a = configuration.getChildNodes.item(1)

b = a.getChildNodes.item(0)

z = root.getElementsByTagName('param.appname').item(0)
y = z.getChildNodes.item(0)
y.setNodeValue('TEST')

xmlwrite('test.prj', DOMnode)
