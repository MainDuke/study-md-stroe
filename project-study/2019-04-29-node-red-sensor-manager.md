2019-04-29T08:20:47.375Z npm install --no-audit --no-update-notifier --save --save-prefix="~" --production node-red-contrib-easybotics-air-quality@0.6.7
2019-04-29T08:21:58.445Z [out]
2019-04-29T08:21:58.445Z [out] > epoll@2.0.9 install /root/.node-red/node_modules/epoll
2019-04-29T08:21:58.445Z [out] > node-gyp rebuild
2019-04-29T08:21:58.445Z [out]
2019-04-29T08:22:02.127Z [out] make: 디렉터리 '/root/.node-red/node_modules/epoll/build' 들어감
2019-04-29T08:22:02.127Z [out] CXX(target) Release/obj.target/epoll/src/epoll.o
2019-04-29T08:22:08.101Z [out] SOLINK_MODULE(target) Release/obj.target/epoll.node
2019-04-29T08:22:08.559Z [out] COPY Release/epoll.node
2019-04-29T08:22:08.586Z [out] make: 디렉터리 '/root/.node-red/node_modules/epoll/build' 나감
2019-04-29T08:22:08.617Z [out]
2019-04-29T08:22:08.617Z [out] > serialport@6.2.2 install /root/.node-red/node_modules/node-red-contrib-easybotics-air-quality/node_modules/serialport
2019-04-29T08:22:08.617Z [out] > prebuild-install || node-gyp rebuild
2019-04-29T08:22:08.617Z [out]
2019-04-29T08:22:17.243Z [err] prebuild-install WARN install No prebuilt binaries found (target=10.15.3 runtime=node arch=arm platform=linux)
2019-04-29T08:22:17.648Z [out] make: 디렉터리 '/root/.node-red/node_modules/node-red-contrib-easybotics-air-quality/node_modules/serialport/build' 들어감
2019-04-29T08:22:17.651Z [out] CXX(target) Release/obj.target/serialport/src/serialport.o
2019-04-29T08:22:20.106Z [err] ../src/serialport.cpp: In function ‘Nan::NAN_METHOD_RETURN_TYPE Open(Nan::NAN_METHOD_ARGS_TYPE)’:
2019-04-29T08:22:20.106Z [err] ../src/serialport.cpp:41:49: warning: ‘v8::String::Utf8Value::Utf8Value(v8::Local<v8::Value>)’ is deprecated: Use Isolate version [-Wdeprecated-declarations]
2019-04-29T08:22:20.106Z [err] v8::String::Utf8Value path(info[0]->ToString());
2019-04-29T08:22:20.106Z [err] ^
2019-04-29T08:22:20.107Z [err] In file included from /root/.node-gyp/10.15.3/include/node/v8.h:26:0,
2019-04-29T08:22:20.107Z [err] from /root/.node-gyp/10.15.3/include/node/node.h:63,
2019-04-29T08:22:20.107Z [err] from ../../../../nan/nan.h:53,
2019-04-29T08:22:20.107Z [err] from ../src/./serialport.h:6,
2019-04-29T08:22:20.107Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.107Z [err] /root/.node-gyp/10.15.3/include/node/v8.h:2892:28: note: declared here
2019-04-29T08:22:20.107Z [err] explicit Utf8Value(Local<v8::Value> obj));
2019-04-29T08:22:20.107Z [err] ^
2019-04-29T08:22:20.107Z [err] /root/.node-gyp/10.15.3/include/node/v8config.h:324:3: note: in definition of macro ‘V8_DEPRECATED’
2019-04-29T08:22:20.107Z [err] declarator **attribute**((deprecated(message)))
2019-04-29T08:22:20.107Z [err] ^~~~~~~~~~
2019-04-29T08:22:20.107Z [err] ../src/serialport.cpp:48:53: warning: ‘v8::Local<v8::Object> v8::Value::ToObject() const’ is deprecated: Use maybe version [-Wdeprecated-declarations]
2019-04-29T08:22:20.107Z [err] v8::Local<v8::Object> options = info[1]->ToObject();
2019-04-29T08:22:20.107Z [err] ^
2019-04-29T08:22:20.109Z [err] In file included from /root/.node-gyp/10.15.3/include/node/node.h:63:0,
2019-04-29T08:22:20.109Z [err] from ../../../../nan/nan.h:53,
2019-04-29T08:22:20.109Z [err] from ../src/./serialport.h:6,
2019-04-29T08:22:20.109Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.109Z [err] /root/.node-gyp/10.15.3/include/node/v8.h:10046:15: note: declared here
2019-04-29T08:22:20.109Z [err] Local<Object> Value::ToObject() const {
2019-04-29T08:22:20.109Z [err] ^~~~~
2019-04-29T08:22:20.122Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterOpen(uv_work_t*)’:
2019-04-29T08:22:20.122Z [err] ../src/serialport.cpp:95:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.122Z [err] data->callback.Call(2, argv);
2019-04-29T08:22:20.122Z [err] ^
2019-04-29T08:22:20.122Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.122Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.122Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.122Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.122Z [err] ^~~~
2019-04-29T08:22:20.125Z [err] ../src/serialport.cpp: In function ‘Nan::NAN_METHOD_RETURN_TYPE Update(Nan::NAN_METHOD_ARGS_TYPE)’:
2019-04-29T08:22:20.125Z [err] ../src/serialport.cpp:113:53: warning: ‘v8::Local<v8::Object> v8::Value::ToObject() const’ is deprecated: Use maybe version [-Wdeprecated-declarations]
2019-04-29T08:22:20.125Z [err] v8::Local<v8::Object> options = info[1]->ToObject();
2019-04-29T08:22:20.125Z [err] ^
2019-04-29T08:22:20.125Z [err] In file included from /root/.node-gyp/10.15.3/include/node/node.h:63:0,
2019-04-29T08:22:20.125Z [err] from ../../../../nan/nan.h:53,
2019-04-29T08:22:20.125Z [err] from ../src/./serialport.h:6,
2019-04-29T08:22:20.125Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.125Z [err] /root/.node-gyp/10.15.3/include/node/v8.h:10046:15: note: declared here
2019-04-29T08:22:20.125Z [err] Local<Object> Value::ToObject() const {
2019-04-29T08:22:20.125Z [err] ^~~~~
2019-04-29T08:22:20.130Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterUpdate(uv_work_t*)’:
2019-04-29T08:22:20.130Z [err] ../src/serialport.cpp:150:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.130Z [err] data->callback.Call(1, argv);
2019-04-29T08:22:20.130Z [err] ^
2019-04-29T08:22:20.130Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.130Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.130Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.130Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.130Z [err] ^~~~
2019-04-29T08:22:20.135Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterClose(uv_work_t*)’:
2019-04-29T08:22:20.135Z [err] ../src/serialport.cpp:188:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.135Z [err] data->callback.Call(1, argv);
2019-04-29T08:22:20.135Z [err] ^
2019-04-29T08:22:20.135Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.135Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.135Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.135Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.135Z [err] ^~~~
2019-04-29T08:22:20.140Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterFlush(uv_work_t*)’:
2019-04-29T08:22:20.140Z [err] ../src/serialport.cpp:231:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.140Z [err] data->callback.Call(1, argv);
2019-04-29T08:22:20.140Z [err] ^
2019-04-29T08:22:20.140Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.140Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.140Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.140Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.140Z [err] ^~~~
2019-04-29T08:22:20.141Z [err] ../src/serialport.cpp: In function ‘Nan::NAN_METHOD_RETURN_TYPE Set(Nan::NAN_METHOD_ARGS_TYPE)’:
2019-04-29T08:22:20.141Z [err] ../src/serialport.cpp:250:53: warning: ‘v8::Local<v8::Object> v8::Value::ToObject() const’ is deprecated: Use maybe version [-Wdeprecated-declarations]
2019-04-29T08:22:20.141Z [err] v8::Local<v8::Object> options = info[1]->ToObject();
2019-04-29T08:22:20.141Z [err] ^
2019-04-29T08:22:20.142Z [err] In file included from /root/.node-gyp/10.15.3/include/node/node.h:63:0,
2019-04-29T08:22:20.142Z [err] from ../../../../nan/nan.h:53,
2019-04-29T08:22:20.142Z [err] from ../src/./serialport.h:6,
2019-04-29T08:22:20.142Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.142Z [err] /root/.node-gyp/10.15.3/include/node/v8.h:10046:15: note: declared here
2019-04-29T08:22:20.142Z [err] Local<Object> Value::ToObject() const {
2019-04-29T08:22:20.142Z [err] ^~~~~
2019-04-29T08:22:20.147Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterSet(uv_work_t*)’:
2019-04-29T08:22:20.147Z [err] ../src/serialport.cpp:285:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.147Z [err] data->callback.Call(1, argv);
2019-04-29T08:22:20.147Z [err] ^
2019-04-29T08:22:20.147Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.147Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.147Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.147Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.147Z [err] ^~~~
2019-04-29T08:22:20.160Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterGet(uv_work_t*)’:
2019-04-29T08:22:20.160Z [err] ../src/serialport.cpp:336:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.160Z [err] data->callback.Call(2, argv);
2019-04-29T08:22:20.160Z [err] ^
2019-04-29T08:22:20.160Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.160Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.160Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.160Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.160Z [err] ^~~~
2019-04-29T08:22:20.171Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterGetBaudRate(uv_work_t*)’:
2019-04-29T08:22:20.171Z [err] ../src/serialport.cpp:383:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.171Z [err] data->callback.Call(2, argv);
2019-04-29T08:22:20.171Z [err] ^
2019-04-29T08:22:20.171Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.171Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.171Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.171Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.171Z [err] ^~~~
2019-04-29T08:22:20.175Z [err] ../src/serialport.cpp: In function ‘void EIO_AfterDrain(uv_work_t*)’:
2019-04-29T08:22:20.175Z [err] ../src/serialport.cpp:424:30: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:20.175Z [err] data->callback.Call(1, argv);
2019-04-29T08:22:20.175Z [err] ^
2019-04-29T08:22:20.175Z [err] In file included from ../src/./serialport.h:6:0,
2019-04-29T08:22:20.175Z [err] from ../src/serialport.cpp:1:
2019-04-29T08:22:20.175Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:20.175Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:20.175Z [err] ^~~~
2019-04-29T08:22:23.481Z [out] CXX(target) Release/obj.target/serialport/src/serialport_unix.o
2019-04-29T08:22:27.203Z [out] CXX(target) Release/obj.target/serialport/src/poller.o
2019-04-29T08:22:29.326Z [err] ../src/poller.cpp: In static member function ‘static void Poller::onData(uv_poll_t*, int, int)’:
2019-04-29T08:22:29.326Z [err] ../src/poller.cpp:69:29: warning: ‘v8::Local<v8::Value> Nan::Callback::Call(int, v8::Local<v8::Value>*) const’ is deprecated [-Wdeprecated-declarations]
2019-04-29T08:22:29.326Z [err] obj->callback.Call(2, argv);
2019-04-29T08:22:29.326Z [err] ^
2019-04-29T08:22:29.326Z [err] In file included from ../src/poller.cpp:1:0:
2019-04-29T08:22:29.326Z [err] ../../../../nan/nan.h:1674:3: note: declared here
2019-04-29T08:22:29.326Z [err] Call(int argc, v8::Local<v8::Value> argv[]) const {
2019-04-29T08:22:29.326Z [err] ^~~~
2019-04-29T08:22:32.233Z [out] CXX(target) Release/obj.target/serialport/src/serialport_linux.o
2019-04-29T08:22:32.233Z [out] SOLINK_MODULE(target) Release/obj.target/serialport.node
2019-04-29T08:22:32.233Z [out] COPY Release/serialport.node
2019-04-29T08:22:32.233Z [out] make: 디렉터리 '/root/.node-red/node_modules/node-red-contrib-easybotics-air-quality/node_modules/serialport/build' 나감
2019-04-29T08:22:35.026Z [err] npm
2019-04-29T08:22:35.027Z [err] WARN node-red-project@0.0.1 No repository field.
2019-04-29T08:22:35.027Z [err] npm WARN node-red-project@0.0.1 No license field.
2019-04-29T08:22:35.028Z [err]
2019-04-29T08:22:35.032Z [out] + node-red-contrib-easybotics-air-quality@0.6.7
2019-04-29T08:22:35.032Z [out] added 16 packages from 16 contributors in 104.617s
2019-04-29T08:22:35.065Z rc=0
