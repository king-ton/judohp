source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Benutzer MySQL als Datenbank für Active Record
gem 'mysql2', '~> 0.3.15'

####################
# Assets

# Benutze SASS für stylesheets
gem 'sass-rails', '~> 4.0.3'

# Bootstrap für Oberfläche
gem 'bootstrap-sass', '~> 3.1.1'


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

####################
# JavaScript

gem 'jquery-rails' # Benutze jQuery als JavaScript-Bibliothek
gem 'jquery-ui-rails' # Benutze jQuery-UI als JavaScript-Bibliothek
gem 'jquery-tablesorter' # Sortierbare Tabellen

# Auswahl Datum
gem 'bootstrap-datepicker-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'#, '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


####################
# Tests

# Benutze RSpec als Test-Framework
gem 'rspec-rails', '>= 2.2', group: [:test]

# Simuliere Benutzer
gem 'capybara', group: [:test]

# Erzeuge Datensätze nach bestimmten Muster
gem 'factory_girl_rails', group: [:test]

gem 'guard-rspec', group: [:test]
gem 'spring-commands-rspec', group: [:test, :development]


####################
# Development

# Lädt Änderungen ohne Neustart
gem 'spring', group: :development

# Schreibt Felder des Models in Model-Datei
gem 'annotate', group: :development

####################
# RBAC-Sytem

# Benutze ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Authorization-Gem
gem 'pundit'

####################
# Formulare

# Vereinfacht die erzeugung von Formularen
gem 'simple_form'
gem 'country_select' # Wähle Land aus

# Hilfe für Nested Forms
#gem 'cocoon'

####################
# CI

# Gem für Jenkins
gem 'ci_reporter', group: [:test]

# Findet Sicherheitslücken
gem 'brakeman', group: [:test]

# Test-Abdeckung
gem 'simplecov', group: [:test]
gem 'simplecov-rcov', group: [:test]

