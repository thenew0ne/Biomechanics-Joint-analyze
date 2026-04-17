# Hip Joint Center Estimation Using the Secant Method

## Overview

This MATLAB program estimates the center coordinates and radius of the hip joint by fitting a sphere to the measured trajectory of a thigh marker.
Because the hip joint can be modeled as a spherical joint, the marker trajectory is assumed to lie approximately on the surface of a sphere. Due to measurement noise and other experimental errors, the trajectory does not form a perfect sphere, so the center and radius must be estimated numerically.

The program applies the **Secant Method** to solve the nonlinear equations obtained from minimizing the error function of the sphere-fitting problem.

## Purpose

The objective of this program is to find:

* the center of the approximated sphere, which represents the **hip joint center**
* the radius of the sphere

This is done by minimizing the difference between the measured marker positions and the ideal spherical surface.

## Mathematical Background

If the hip joint is assumed to be a perfect ball-and-socket joint, the thigh marker moves on a sphere.
For a sphere with center ((a, b, c)) and radius (R), the distance from each measured point ((x_i, y_i, z_i)) to the center should ideally be equal to (R).

Because real data contains noise, an error function is defined, and the optimal center and radius are obtained by minimizing this error.
The minimum is found when the partial derivatives of the error function become zero.


## Input Data

The input of the program is the set of experimental coordinates of the thigh marker trajectory:

* (x_i)
* (y_i)
* (z_i)

These values are used to construct the nonlinear equations for sphere fitting.

## Method

The program follows these steps:

1. Load or define the marker trajectory data.
2. Construct the objective function based on the sphere model.
3. Derive the nonlinear equations from the condition that the partial derivatives of the error function are zero.
4. Use the **Secant Method** iteratively to update the estimated center coordinates.
5. Continue the iteration until the solution converges within a specified tolerance.
6. Compute the sphere radius from the estimated center.

## Output

The program returns:

* estimated hip joint center coordinates ((a, b, c))
* estimated sphere radius (R)
* iteration results or convergence information

These values represent the approximated center of rotation of the hip joint.

