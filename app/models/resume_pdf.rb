
# resume pdf 下载
class ResumePdf
  attr_accessor :applicant, :resume

  def initialize(applicant, resume)
    @applicant = applicant
    @resume    = resume
  end

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("#{Rails.root}/public/resume.pdf")
  end

  def filename
    "#{applicant.name}的简历.pdf"
  end

  private

    # 渲染出 html 
    def as_html
      #直接使用 对应controller
      ResumesController.render template: 'resumes/pdf', layout: 'resume_pdf', locals: {applicant: applicant, resume: resume}
    end

end