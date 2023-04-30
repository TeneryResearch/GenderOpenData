# GenderOpenData.org

The GenderOpenData platform is a volunteer-driven repository for gender data and
resources for feminist advocacy and research across the continent. Accessible at
<https://genderopendata.org/>

Built by [Tenery Research](https://tenery.cc/) for [CWRA](https://cwra.africa/)

## Getting Started

**Requirements:**

- Docker
- [direnv](https://direnv.net/)

### Development

1. copy `.env.tmpl` & `.envrc.tmpl` to `.env` & `.envrc` and edit appropriately
2. run `direnv allow`
3. start up everything with `make web`
4. start coding

**Additional steps:**

1. `make web-bash` to enter the bash
2. create fake data:

    ```sh
    ckan generate fake-data organization -n 5
    ckan generate fake-data dataset -n 5 --owner_org=<org1.id>
    ckan generate fake-data dataset -n 5 --owner_org=<org2.id>
    ckan generate fake-data dataset -n 5 --owner_org=<org3.id>
    ckan generate fake-data dataset -n 5 --owner_org=<org4.id>
    ckan generate fake-data dataset -n 5 --owner_org=<or5.id>
    ```

3. `ckan search-index rebuild`  to index the data

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
