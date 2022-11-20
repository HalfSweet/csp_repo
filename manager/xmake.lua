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
-- Copyright (C) 2022-present xqyjlj<xqyjlj@126.com>, csplink.github.io
--
-- @author      xqyjlj
-- @file        xmake.lua
--

set_xmakever("2.7.2")

if is_mode("debug") then
    add_defines("DEBUG")
end

for _, file in ipairs(os.files("tasks/*.lua")) do
    includes(file)
end

local build_xmake_path = path.absolute(os.projectdir() .. "/build/xmake.lua")
if has_config("buildir") then
    if not os.exists(build_xmake_path) then
        print("please use command 'xmake csp -i' to init this project")
    end
end

if not os.exists(build_xmake_path) then
    target("csp_target")
    target_end()

    rule("csp_rule")
    rule_end()
end

if os.exists(build_xmake_path) then
    includes(build_xmake_path)
end
