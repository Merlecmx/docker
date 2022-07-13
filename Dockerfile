# Copyright 2020 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# FROM gcr.io/oss-fuzz-base/base-builder
FROM r4bbit/oss-fuzz
RUN git clone --depth 1 https://gitlab.freedesktop.org/freetype/freetype
RUN apt-get update
RUN apt-get install --no-install-recommends -y make wget cmake qtbase5-dev libcups2-dev autoconf automake autotools-dev libtool
RUN wget https://dl.xpdfreader.com/xpdf-latest.tar.gz

WORKDIR $SRC
COPY fuzz_*.cc $SRC/
COPY build.sh $SRC/
COPY fuzz_*.options $SRC/
