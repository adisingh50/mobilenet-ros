
class RollingAverage:
    def __init__(self):
        self.numerator = 0
        self.threshold = 1000 # in mm
        self.max_size = 10  # max queue size
        self.last_depth = 0
        self.queue = []

    def addDepth(self, new_depth):
        if len(self.queue) < self.max_size:
            self.queue.append(new_depth)
            self.last_depth = new_depth
            self.numerator += new_depth
            return

        curr_avg = self.numerator / len(self.queue)
        diff_from_avg = abs(curr_avg - new_depth)

        if (diff_from_avg > self.threshold):
            self.last_depth = -1  #mark the most recent depth reading as faulty so we don't display anything
        else:
            oldest_depth = self.queue.pop(0)
            self.numerator -= oldest_depth
            self.queue.append(new_depth)
            self.numerator += new_depth
            self.last_depth = new_depth


    def getDepth(self):
        return self.last_depth
