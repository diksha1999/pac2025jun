#!/usr/bin/env python3
"""
Simple Python application for testing PAC in Aug Month from feat branch
"""

def hello_world():
    """Return a greeting message"""
    return "Hello from Pipelines as Code!"

def add_numbers(a, b):
    """Add two numbers together"""
    return a + b

if __name__ == "__main__":
    print(hello_world())
    result = add_numbers(5, 3)
    print(f"5 + 3 = {result}")
