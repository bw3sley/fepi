from index import Calculator

def test_sum():
    calculator = Calculator()
    assert calculator.sum(1, 2) == 3

def test_subtract():
    calculator = Calculator()
    assert calculator.subtract(3, 2) == 1

def test_multiply():
    calculator = Calculator()
    assert calculator.multiply(2, 3) == 6

def test_divide():
    calculator = Calculator()
    assert calculator.divide(6, 3) == 2

# pytest -k test_divide testing.py