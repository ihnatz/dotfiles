import sublime
import sublime_plugin
import re, inspect, os

class CreateRspecFileCommand(sublime_plugin.WindowCommand):
  def run(self):
    splited_path = self.window.active_view().file_name()
    if splited_path is None: return True
    splited_path = splited_path.split(os.path.sep)

    filename, filepath = splited_path[-1], splited_path[0:-1]

    if 'lib' in filepath:
      print("NON-RAILS")

    try:
      index = self.main_folder_index(filepath)
    except:
      return True

    filepath[index] = 'spec'
    spec_dir_path = os.path.sep.join(filepath)
    try:
      os.makedirs(spec_dir_path)
    except:
      pass

    fullpath = os.path.sep.join([spec_dir_path, self.to_spec_name(filename)])
    requrefilepath = os.path.sep.join(filepath[index+1:] + [filename])
    self.spec_touch(fullpath, requrefilepath)

    self.open_file_in_window()
    return True

  def main_folder_index(self, filepath):
    keyword = 'app'
    if filepath.count(keyword) == 0:
      keyword = 'lib'
    return filepath.index(keyword)

  def spec_touch(self, fname, spec_path):
    if not os.path.exists(fname):
      open(fname, 'a').write('require "' + spec_path + '"\nrequire "spec_helper"\n')

  def to_spec_name(self, filename):
    spec_name = filename.split('.')
    spec_name[0] = spec_name[0] + "_spec"
    return '.'.join(spec_name)

  def open_file_in_window(self):
    try:
      self.window.run_command('open_rspec_file')
    except:
      print("You can use RSpec sublime plugin to auto-open created file.")
