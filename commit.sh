#!/usr/bin/env bash
cd ~/IdeaProjects/code-gen-tpls &&  git add . && git commit -m"修改" && git push coding hlsa &&  proxychains4 git push origin hlsa && echo code-gen-tpls push success
