{application, counter,
 [{description, "counter app"},
  {vsn, "1.0"},
  {modules, [counter, counter_sup]},
  {registered, [counter, counter_sup]},
  {applications, [kernel, stdlib]},
  {mod, {counter_app, 10}}]}.
