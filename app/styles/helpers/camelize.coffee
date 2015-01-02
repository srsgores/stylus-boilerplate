###
	stylus-boilerplate

	camelize.coffee

	@author Sean

	@note Created on 2014-08-28 by PhpStorm
	@note uses Codoc
	@see https://github.com/coffeedoc/codo
###

###
	Stylus helper for "camelizing" a string
	@see http://stackoverflow.com/questions/25477795/stylus-generate-camelcase-variable
	@example
		to-uppercase("mystring") => "MYSTRING"
###
module?.exports = ->
	(stylus) ->
		stylus.define "to-upper-case", (node) ->
			nodeName = node.nodeName
			val = node.string
			if nodeName is "string"
				new stylus.nodes.String(val.toUpperCase())
			else if nodeName is "ident"
				new stylus.nodes.Ident(val.toUpperCase())
			else
				throw new Error "to-upper-case accepts string or ident but got #{nodeName}"
