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
  has_secure_password

  # 性别
  Sex       = %w(男 女).freeze
  # 学历
  Education = %w(小学 初中 高中 专科 本科 硕士以上).freeze

  # 创建
  validates :email,    presence: true, on: :create
  validates :email,    uniqueness: true, on: :create
  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}, on: :create
  validates :password, length: {in: 6..10}, on: :create
  # 更新
  validates :name, :email, :age, :mobile, :city, :sex, :school, :education,
            presence: true, on: :update # 存在

  validates :name, :email, :mobile, :city, :school, :address, :blog_address,
            length: {in: 1..50}, allow_blank: true, on: :update         # 长度

  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}, on: :update

  validates :email, uniqueness: true, on: :update

  validates :mobile,
            format: {with: /\d{11}/}, on: :update
  
  validates :age, numericality: {greater_than: 0}, on: :update

  validates :sex, inclusion: {in: Sex}, on: :update

  validates :education, inclusion: {in: Education}, on: :update


end
