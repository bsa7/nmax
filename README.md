nmax [![Gem Version](https://badge.fury.io/rb/nmax-aoirgf.svg)](https://badge.fury.io/rb/nmax-aoirgf) [![Build Status](https://travis-ci.org/r72cccp/nmax.svg?branch=master)](https://travis-ci.org/r72cccp/nmax)
====

Ruby gem, reads text data from the input stream, upon completion of the input, displays the n largest integers,
met in the received text data.

usage
-----

Script runs from console with command:
```bash
cat <filename> | nmax <limit_count>
```

Where
* `filename` - name of file with text data;
* `limit_count` - limit count of founded biggest numbers

test
----

```bash
rake test
```

install
-------

* gem install nmax-aoirgf

*Note:* You may need to use sudo to install gems, but it is preferable to do without it.

license
-------

Copyright (C) 2020 Sergio Belevskij

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
