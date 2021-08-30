# frozen_string_literal: true

# All daily jobs
namespace :hc do
  task themes: :environment do
    Site.all.each(&:merge_new_style_classes_from_theme!)
  end
end
