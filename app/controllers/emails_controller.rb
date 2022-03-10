class EmailsController < ApplicationController
    def index
        @emails = Email.all
    end

    def create
        @email = Email.new(object: Faker::Superhero.name, body: Faker::Lorem.paragraph(sentence_count: rand(50..200)))
        if @email.save
            respond_to do |format|
                format.html { redirect_to notes_path }
                format.js { }
            end
        else
            puts "IT DOESN'T WORK"
        end
    end

    def show
        @email = Email.find(params[:id])
        @email.update(read: true)
        respond_to do |format|
            format.html { redirect_to email_path(params[:id]) }
            format.js { }
        end
    end

    def destroy
        @email = Email.find(params[:id])
        Email.find(params[:id]).destroy
        respond_to do |format|
            format.html { redirect_to emails_path }
            format.js { }
        end
    end

    def update
        @email = Email.find(params[:id])
        @email.update(read: (!@email.read))
    end
end
