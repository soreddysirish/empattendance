class PdfMailer < ApplicationMailer
	default from: 'hr@codingmart.com'

	def email_invoice(employee,report)
		 @employee =employee
		 @report =report
		 @first_month_report =report
  		mail(:subject => 'Your pay slip', :to => @employee.email) do |format|
  			format.html
  			format.text
        format.pdf do
          attachments['payslip.pdf'] = WickedPdf.new.pdf_from_string(
            render_to_string(:pdf => "report",
              locals: {:employee => @employee,:reports => @report},
              :template => 'attendances/showpdf.pdf.erb',
              layout: 'mailer.html.erb',
              encoding: "UTF-8"))
        end
      end
	end
end

