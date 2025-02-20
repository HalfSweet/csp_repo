--
-- Licensed under the GNU General Public License v. 3 (the "License");
-- You may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     https://www.gnu.org/licenses/gpl-3.0.html
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- Copyright (C) 2023-2023 xqyjlj<xqyjlj@126.com>
--
-- @author      xqyjlj
-- @file        xmake.lua
--
-- Change Logs:
-- Date           Author       Notes
-- ------------   ----------   -----------------------------------------------
-- 2023-12-17     xqyjlj       initial version
--
task("csp-project")
do
    on_run("main")
    set_category("plugin")
    -- LuaFormatter off
    set_menu {
        usage = "xmake csp-project [options]",
        description = "Generate the project file.",
        options = {
            {"k",   "kind",             "kv",   "cmake",                                    "Set the project kind.",
                                                                                            "    - cmake",
                                                                                            "    - cmakelists",},
            {nil,   "outputdir",        "v",    ".",                                        "Set the output directory."},
        }
    }
    -- LuaFormatter on
end
task_end()
