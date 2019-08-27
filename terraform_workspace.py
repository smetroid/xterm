import os
from powerline_shell.utils import BasicSegment
from decimal import Decimal

class Segment(BasicSegment):
   def add_to_powerline(self):
      command_ls = 'ls *.tf 2>/dev/null | wc -l | tr -d " "'
      ls = os.popen(command_ls).read()
      if float(int(ls.rstrip())) > 0:
         command = 'terraform workspace list | grep "^*" | cut -d " " -f 2'
         terraform_workspace = os.popen(command).read()
         #print(terraform_workspace)
         if terraform_workspace:
             self.powerline.append('tf-workspace:%s ' % terraform_workspace.rstrip(),
                                   self.powerline.theme.PATH_BG,
                                   self.powerline.theme.PATH_FG)
