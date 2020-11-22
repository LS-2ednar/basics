import matplotlib.pyplot as plt
import numpy as np
import datetime

def dmg(dmg):
    x = range(len(dmg))
    y = dmg
    
    plt.plot(x,y)
    plt.title('DMG Table from the Session of the 22/11/20')
    



Team = [2,3,4,3,2,3,4,5,6,6,6,6,8,8,8,8,8,9,10,10,32,2321,1,2,1]
dmg(Team)
