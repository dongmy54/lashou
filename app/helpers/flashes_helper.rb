# 文件名 he module 对应
module FlashesHelper

  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def fetch_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end

end