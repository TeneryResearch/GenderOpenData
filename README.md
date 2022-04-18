# GenderOpenData.org

The GenderOpenData platform is a volunteer-driven repository for gender data and
resources for feminist advocacy and research across the continent. Accessible at
https://genderopendata.org/

Built by [Tenery Research](https://tenery.cc/) for [CWRA](https://cwra.africa/)

## Getting Started

**Requirements:**

- Docker
- docker-compose
- [direnv](https://direnv.net/)

### Development

1. copy `.env.tmpl` & `.envrc.tmpl` to `.env` & `.envrc` and edit appropriately
2. run `direnv allow`
3. start up everything with `docker-compose up datapusher`
4. start coding

**Additional steps:**

5. `make bash` to enter the bash
6. `ckan seed gov && ckan seed user` to seed the data
7. `ckan search-index rebuild`  to index the data 


**PS: To Reload Server:** Save / touch `ckan-uwsgi.ini` to reload the server


---

## License

The GenderOpenData platform is a volunteer-driven data platform.
Copyright (c) 2021 - 2022 Center for Women's Rights Advocacy

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
