# == Schema Information
#
# Table name: industries
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# 行业
class Industry < ApplicationRecord
  has_many :companies, dependent: :destroy

  # 类型
  Type = %w(
    农、林、牧、渔业
    采矿业
    制造业
    电力、燃气及水的生产和供应业
    建筑业
    交通运输、仓储和邮政业
    信息传输、计算机服务和软件业
    批发和零售业
    住宿和餐饮业
    金融业
    房地产业
    租赁和商务服务业
    科学研究、技术服务和地质勘查业
    水利、环境和公共设施管理业
    居民服务和其他服务业
    教育
    卫生、社会保障和社会福利业
    文化、体育和娱乐业
  )

  validates_inclusion_of :name, in: Type
  
end
