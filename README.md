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

4. `make bash` to enter the bash
5. `ckan search-index rebuild`  to index the data
6. `ckan seed gov && ckan seed user` to seed the data


**PS: To Reload Server:** Save / touch `ckan-uwsgi.ini` to reload the server


---

## License

MIT License

Copyright (c) 2021 - 2022 Center for Women's Rights Advocacy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
