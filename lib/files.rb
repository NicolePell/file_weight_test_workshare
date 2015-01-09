class Files

  attr_accessor :files
  attr_reader :file_types

  def initalize
    @file_types = {
      songs: ["mp3", "aac", "ogg", "wma", "flac", "wav"],
      videos: ["avi", "mp4", "mkv", "mov", "mpg", "mpeg"],
      documents: ["docx", "xlsx", "pptx", "odt", "doc", "xls", "ppt", "sxw", "stw", "sxc", "stc", "sxi", "sti", "sxd", "std", "sxm"],
      binaries: ["bin"],
      text: ["txt"]
    }
  end

  def process(array)
    self.files = array.map {|file| {name: file["name"], ext: file["extension"], size: file["size"]} }
  end

  def songs
    self.files.select {|file| self.file_types[:songs].include?(file[:ext]) }
  end

  def videos
    self.files.select {|file| self.file_types[:videos].include?(file[:ext]) }
  end

  def documents
    self.files.select {|file| self.file_types[:documents].include?(file[:ext]) }
  end

  def binaries
    self.files.select {|file| self.file_types[:binaries].include?(file[:ext]) }
  end

  def text
    self.files.select {|file| self.file_types[:text].include?(file[:ext]) }
  end

  def other
    self.files.reject { |file| self.file_types.values.flatten.include?(file[:ext]) }
  end

  def total_size
    self.files.inject(0) {|res, file| res + file[:size] / 1000000}
  end

end
