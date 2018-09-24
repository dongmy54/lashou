# == Schema Information
#
# Table name: applicants
#
#  id              :bigint(8)        not null, primary key
#  address         :string
#  age             :integer
#  avatar          :string
#  blog_address    :string
#  city            :string
#  education       :string
#  email           :string
#  mobile          :string
#  name            :string
#  password_digest :string
#  school          :string
#  sex             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# 求职者
class Applicant < ApplicationRecord
  has_many :resumes, dependent: :destroy
  # 发送投递
  has_many :send_delivers, through: :resumes, source: :deliver_records

  mount_uploader :avatar, AvatarUploader
  has_secure_password

  # 性别
  Sex       = %w(男 女).freeze
  # 学历
  Education = %w(小学 初中 高中 专科 本科 硕士以上).freeze

  # 创建
  validates :email,    presence: true, on: :create
  validates :password, length: {in: 6..10}, on: :create
  validates :password, length: {in: 6..10}, allow_blank: true
  
  validates :name, :email, :age, :mobile, :city, :sex, :school, :education,
            presence: true, on: :update # 存在

  validates :name, :email, :mobile, :city, :school, :address, :blog_address,
            length: {in: 1..50}, allow_blank: true         # 长度

  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}

  validates :email, uniqueness: true

  validates :mobile,
            format: {with: /\d{11}/}, allow_blank: true
  
  validates :age, numericality: {greater_than: 0}, allow_blank: true

  validates :sex, inclusion: {in: Sex}, allow_blank: true

  validates :education, inclusion: {in: Education}, allow_blank: true

  # 投递数据
  def deliver_data(current_page)
    current_page  = current_page.to_i < 1 ? 1 : current_page.to_i
    offset_number = (current_page - 1) * 4 # 每页 4

    sql = "select c.logo, c.name company_name, j.name job_name, j.start_salary, j.end_salary,
                       r.title resume_title, dr.state, dr.comment, dr.created_at
                from deliver_records dr
                inner join jobs j on j.id = dr.job_id
                inner join companies c on c.id = j.company_id
                inner join resumes r on r.id = dr.resume_id
                inner join applicants a on a.id = r.applicant_id
                where a.id = ? limit 4 offset ?"

    # 为了照顾 logo_url 方法用 company
    datas       = Company.find_by_sql [sql, self.id, offset_number]
    total_count = deliver_count
    total_page  = (total_count / 4) + (total_count % 4 == 0 ? 0 : 1)

    [datas, current_page, total_page]
  end

  def deliver_count
    self.send_delivers.count
  end

end
