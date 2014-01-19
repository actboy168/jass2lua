require 'jass_lexer'

local token = {}

token.equal         = '=='
token.not_equal     = '!='
token.less          = '<'
token.less_equal    = '<='
token.greater       = '>'
token.greater_equal = '>='
token.plus          = '+'
token.minus         = '-'
token.times         = '*'
token.divide        = '/'
token.lparen        = '()'
token.rparen        = ')'
token.lbracket      = '['
token.rbracket      = ']'
token.comma         = ','
token.assign        = '='
token.lit_dec       = '0'
token.lit_hex       = '0x0'
token.lit_char      = '\'d\''
token.lit_real      = '.0'
token.lit_string    = '""'
token.identifier    = 'a'
token.newline       = [[

]]

token.key_if          = 'if'
token.key_not         = 'not'
token.key_then        = 'then'
token.key_type        = 'type'
token.key_extends     = 'extends'
token.key_handle      = 'handle'
token.key_globals     = 'globals'
token.key_endglobals  = 'endglobals'
token.key_constant    = 'constant'
token.key_native      = 'native'
token.key_takes       = 'takes'
token.key_returns     = 'returns'
token.key_function    = 'function'
token.key_endfunction = 'endfunction'
token.key_local       = 'local'
token.key_array       = 'array'
token.key_set         = 'set'
token.key_call        = 'call'
token.key_else        = 'else'
token.key_elseif      = 'elseif'
token.key_endif       = 'endif'
token.key_loop        = 'loop'
token.key_exitwhen    = 'exitwhen'
token.key_return      = 'return'
token.key_debug       = 'debug'
token.key_endloop     = 'endloop'
token.key_null        = 'null'
token.key_true        = 'true'
token.key_false       = 'false'
token.key_code        = 'code'
token.key_string      = 'string'
token.key_integer     = 'integer'
token.key_real        = 'real'
token.key_boolean     = 'boolean'
token.key_nothing     = 'nothing'
token.key_and         = 'and'
token.key_or          = 'or'

for k, v in pairs(token) do
	local it = jass.lexer(v):tokenize()()
	if (not it) or (not it:is_valid()) then
		error('Init token_id failed in [' .. k .. ']:[' .. v .. '].')
	end
	token[k] = it:id()
end

return token
