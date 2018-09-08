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

  Sex = {
    '0' => '男',
    '1' => '女'
  }

  # 学历
  Education = {
    '0' => '小学',
    '1' => '初中',
    '2' => '高中',
    '3' => '专科',
    '4' => '本科',
    '5' => '硕士（以上)'
  }
  # 创建
  validates :email,    presence: true, on: :create
  validates :email,    uniqueness: true, on: :update
  validates :password, length: {in: 6..10}, on: :create
  # 更新
  validates :name, :email, :age, :mobile, :city, :sex, :school, :education,
            presence: true, on: :update # 存在

  validates :name, :email, :mobile, :city, :school, :address, :blog_address,
            length: {in: 1..50}, on: :update         # 长度

  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}, on: :update

  validates :email, uniqueness: true, on: :update

  validates :mobile,
            format: {with: /\d{11}/}, on: :update
  
  validates :age, numericality: {greater_than: 0}, on: :update

  validates :sex, inclusion: {in: Sex.values}, on: :update

  validates :education, inclusion: {in: Education.values}, on: :update


end
