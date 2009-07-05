require 'ostruct'
Wiki = OpenStruct.new

Wiki.name = "JS Rumble 09 - August 22/23 2009"
Wiki.description = "One Weekend of fun JavaScript hacking."
Wiki.license_line = '<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/de/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/3.0/de/88x31.png" /></a><br />This <span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/Text" rel="dc:type">work</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://jsrumble.com" property="cc:attributionName" rel="cc:attributionURL">http://jsrumble.com</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/de/">Creative Commons Attribution-Noncommercial-Share Alike 3.0 Germany License</a>.'

Wiki.allow_anonymous_create = false
Wiki.allow_anonymous_edit = false
Wiki.allow_anonymous_revert = false
Wiki.allow_anonymous_view = true

Wiki.syntax_highlight = true

Wiki.anonymous_gravatar_id = Digest::MD5.hexdigest("anonymous (at) " + Wiki.name)

gem 'BlueCloth'
require 'bluecloth'
Formatter = BlueCloth
