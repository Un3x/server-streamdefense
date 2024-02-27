# frozen_string_literal: true

FactoryBot.define do
  factory :linear_formula, class: 'Linear' do
    structure { association(:structure) }
    slope { 2 }
    intercept { 1 }

    trait :with_production do
      category { 'production' }
      resource { association(:resource) }
    end

    trait :with_cost do
      category { 'cost' }
      resource { association(:resource) }
    end

    trait :with_duration do
      category { 'duration' }
    end

    trait :with_storage do
      category { 'storage' }
    end
  end

  factory :exponential_formula, class: 'Exponential' do
    structure { association(:structure) }
    base { 2 }
    multiplier { 2 }
    default { 1 }

    trait :with_production do
      category { 'production' }
      resource { association(:resource) }
    end

    trait :with_cost do
      category { 'cost' }
      resource { association(:resource) }
    end

    trait :with_duration do
      category { 'duration' }
    end

    trait :with_storage do
      category { 'storage' }
    end
  end
  factory :linear_percentage_formula, class: 'LinearPercentage' do
    structure { association(:structure) }
    treshold { 10 }
    intercept { 1 }
    slope { 2 }
    multiplier { 1 }

    trait :with_production do
      category { 'production' }
      resource { association(:resource) }
    end

    trait :with_cost do
      category { 'cost' }
      resource { association(:resource) }
    end

    trait :with_duration do
      category { 'duration' }
    end

    trait :with_storage do
      category { 'storage' }
    end
  end
end
