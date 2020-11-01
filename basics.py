#Squareroot useing Newton's Methode

def sqroot(n):
    """
    Caluculates the squareroot of a given number and returns it.

    Parameters
    ----------
    n : float
        Number of which the squareroot should be found.

    Returns
    -------
    squareroot.

    """
    root = n/2
    while n / root > 2:
        root = (1/2)*(root+(n/root))
        print(root)
    return root