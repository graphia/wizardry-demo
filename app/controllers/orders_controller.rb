class OrdersController < ApplicationController
  include Wizardry

  wizard(
    name: 'orders',
    class_name: 'Order',
    edit_path_helper: :orders_edit_path,
    update_path_helper: :orders_update_path,
    pages: [
      Wizardry::Pages::QuestionPage.new(
        :who_are_you,
        title: 'Who are you?',
        questions: [
          Wizardry::Questions::ShortAnswer.new(:full_name),
          Wizardry::Questions::ShortAnswer.new(:name)
        ]
      ),
      Wizardry::Pages::QuestionPage.new(
        :size,
        title: 'What size do you want?',
        questions: [
          Wizardry::Questions::Radios.new(:size, { 9 => %(9 inches), 12 => %(12 inches), 15 => %(15 inches) })
        ],
        pages: [
          Wizardry::Pages::QuestionPage.new(
            :bonus_sides,
            title: %(You've qualified for a bonus side dish),
            questions: [
              Wizardry::Questions::Radios.new(:bonus_side_dish, { wedges: "Wedges", fries: "Fries", salad: "Salad" })
            ]
          )
        ],
        next_pages: [
          Wizardry::Routing::NextPage.new(:bonus_sides, proc { |o| o.size == 15 }, label: %(Was the size 15 inches?))
        ]
      ),
      Wizardry::Pages::QuestionPage.new(
        :topping,
        title: 'Which topping would you like?',
        questions: [
          Wizardry::Questions::Radios.new(
            :topping,
            {
              anchovies: 'Anchovies',
              four_seasons: 'Four seasons',
              hawaiian: 'Hawaiian'
            }
          )
        ]
      ),
      Wizardry::Pages::CheckYourAnswersPage.new(
        questions: [Wizardry::Questions::Hidden.new(:complete, true)]
      ),
      Wizardry::Pages::CompletionPage.new
    ]
  )
end
