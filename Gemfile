source 'https://rubygems.org'

#=== CORE ======================================================================
gem 'rails',                                                          '~> 5.0.4'
gem 'pg',                                                              '~> 0.18'
gem 'puma',                                                             '~> 3.0'
gem 'simple_form',                                                      '~> 3.4'

#=== UI ========================================================================
gem 'sass-rails',                                                       '~> 5.0'
gem 'jquery-rails',                                                    '~> 4.2.2'
gem 'turbolinks',                                                         '~> 5'
gem 'hamlit',                                                          '~> 2.8.4'
gem 'hamlit-rails',                                                   '~> 0.2.0'
gem 'uglifier',                                                       '~> 3.2.0'
gem 'bootstrap-sass',                                                 '~> 3.3.6'
gem 'autoprefixer-rails'

#=== CONFIG ====================================================================
gem 'dotenv-rails',                                                     '~> 2.2'
gem 'tzinfo-data',               platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#=== DEV & TEST ================================================================
group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'


  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'rubocop', require: false
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'faker'
  gem 'guard-rspec'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
end
