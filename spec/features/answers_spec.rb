require "rails_helper"

feature "Answers" do

	scenario 'visit answers for question page' do
		answer_1 = create(:answer)
		question = answer_1.question
		answer_2 = create(:answer, question: question)

		visit quiz_question_answers_path(question.quiz, question, question.answers)
		
		expect(page).to have_content(question.text)
		expect(page).to have_content(answer_1.text)
	end
end  