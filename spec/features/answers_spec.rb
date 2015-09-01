require "rails_helper"

feature "Answers" do

	scenario 'visit answers for question page' do
		answer_1 = create(:answer)
		question = answer_1.question
		answer_2 = create(:answer, question: question)

		visit question_answers_path(question, question.answers)
		
		expect(page).to have_content(question.text)
	end
end  