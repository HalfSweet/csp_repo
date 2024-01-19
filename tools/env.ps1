#
# Licensed under the GNU General Public License v. 3 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.gnu.org/licenses/gpl-3.0.html
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright (C) 2023-2024 xqyjlj<xqyjlj@126.com>
#
# @author      xqyjlj
# @file        env.ps1
#
# Change Logs:
# Date           Author       Notes
# ------------   ----------   -----------------------------------------------
# 2024-01-19     xqyjlj       initial version
#
$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$env:XMAKE_RCFILES=${script_dir}+"\scripts\xmake.lua"
