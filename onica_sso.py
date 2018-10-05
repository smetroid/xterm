import os
from powerline_shell.utils import BasicSegment


class Segment(BasicSegment):
   def add_to_powerline(self):
      sso_onica = os.getenv("ONICA_SSO_ACCOUNT_NAME")
      if sso_onica:
          self.powerline.append('sso:%s ' % sso_onica,
                                self.powerline.theme.PATH_BG,
                                self.powerline.theme.PATH_FG)
