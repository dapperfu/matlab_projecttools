function parsing(varargin)
   % narginchk(1,2);
   
    p = inputParser;
    p.addOptional('dependencyOption','default');
    
    p.parse(varargin{:});
    
    dependencyOption = p.Results.dependencyOption; 
end



%  addRequired(PARSEOBJ, ARGNAME, VALIDATOR) adds required argument
%     ARGNAME to the input scheme of object PARSEOBJ.  ARGNAME is a single-
%     quoted string that specifies the name of the required argument.
%     The optional VALIDATOR is a handle to a function that you write, used
%     during parsing to validate the input arguments.  If the VALIDATOR
%     throws an error or returns logical 0 (FALSE), the parsing fails and
%     MATLAB throws an error.
%  
% 
%  addOptional(PARSEOBJ, ARGNAME, DEFAULT, VALIDATOR) adds optional argument
%     ARGNAME to the input scheme of object PARSEOBJ. DEFAULT specifies the
%     value to use when the optional argument ARGNAME is not present in the
%     actual inputs to the function. The optional VALIDATOR input is the same
%     as for ADDREQUIRED.
