


s_methods = methods(service);

for idx = 1:numel(s_methods)
    method = s_methods{idx};
    if strcmp(method(1:3), 'get')
        try
            fprintf('%s: %s\n',method, service.(method)(project_key))
        catch
        end
    end
    
end
