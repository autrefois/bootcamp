import functools
import time


def do_twice(func):
    """Run the decorated function twice"""

    @functools.wraps(func)
    def wrapper_do_twice(*args, **kwargs):
        func()
        return func()
    return wrapper_do_twice


def timer(func):
    """Print the runtime of the decorated function"""

    @functools.wraps(func)
    def wrapper_timer(*args, **kwargs):
        start = time.perf_counter()
        value = func(*args,**kwargs)
        end = time.perf_counter()
        run_time = end - start
        print(f"Finished {func.__name__!r} in {run_time:.4f} seconds")
        return value

    return wrapper_timer


def slow_down_1sec(func):
    @functools.wraps(func)
    def wrapper_slow_down(*args, **kwargs):
        time.sleep(10)
        return func(*args, **kwargs)

    return wrapper_slow_down
