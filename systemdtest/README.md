systemdtest
=====

An OTP application

Build
-----

    $ rebar3 get-deps
    $ rebar3 compile
    $ rebar3 release

    $ ./_build/default/rel/myrel/bin/myrel console


    $ ./_build/default/rel/myrel/bin/myrel start
    $ ./_build/default/rel/myrel/bin/myrel stop
    
Verify complete path as in .service file
----------------------------------------

[File is in this folder](../systemdtest.service). 
The rows I changed is commented the workgroup and updated the paths

```
root@sharessc:~/data7/systemdtest# /root/data7/systemdtest/systemdtest/_build/default/rel/myrel/bin/myrel start
root@sharessc:~/data7/systemdtest# /root/data7/systemdtest/systemdtest/_build/default/rel/myrel/bin/myrel stop
ok
```


Install under systemd
---------------------
```
$ sudo emacs /etc/systemd/system/systemdtest.service

$ systemctl daemon-reload
$ systemctl enable systemdtest
$ systemctl start systemdtest
Job for systemdtest.service failed because the service did not take the steps required by its unit configuration.
See "systemctl status systemdtest.service" and "journalctl -xe" for details.
$ journalctl -xe
```

```
-- The unit UNIT has successfully entered the 'dead' state.
Mar 30 09:57:34 sharessc systemd[1]: systemdtest.service: Failed with result 'protocol'.
-- Subject: Unit failed
-- Defined-By: systemd
-- Support: http://www.ubuntu.com/support
--
-- The unit systemdtest.service has entered the 'failed' state with result 'protocol'.
Mar 30 09:57:34 sharessc systemd[1]: Failed to start My Awesome App.
-- Subject: A start job for unit systemdtest.service has failed
-- Defined-By: systemd
-- Support: http://www.ubuntu.com/support
```
