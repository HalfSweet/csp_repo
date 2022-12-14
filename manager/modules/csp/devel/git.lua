--!csp build system based on xmake
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- Copyright (C) 2022-present xqyjlj<xqyjlj@126.com>
--
-- @author      xqyjlj
-- @file        git.lua
--

import("lib.detect.find_tool")

local git = find_tool("git")
if not git then
    raise("git not found!")
end

function clone(dir, url, version)
    if version == "latest" then
        local command = "git clone --progress --depth=1 --recursive --shallow-submodules %s %s"
        os.vrun(string.format(command, url, dir))
    else
        local command = "git clone --progress --depth=1 --recursive --shallow-submodules --branch=%s %s %s"
        os.vrun(string.format(command, version, url, dir))
    end
end

function submodule_sync(dir, version, opt)
    local git = find_tool("git")
    if git then
        if version == "latest" then
            os.cd(dir)
            os.vrun("git submodule sync --recursive")
            if not opt or not opt["remote"] then
                os.vrun("git submodule update --init --recursive --force")
            elseif opt["remote"] then
                os.vrun("git submodule update --remote --recursive --force")
            end
            os.cd(os.projectdir())
        end
        cprint("     submodules are synchronized")
    else
        raise("git not found!")
    end
end
