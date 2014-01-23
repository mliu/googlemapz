# Tests various algorithms for finding the ideal destination by some combination of distances in a selection of potential destinations.

distances = [
	[28,29,30],
	[35,35,45],
	[15,15,45],
	[7,7,60],
	[1,1,60],
	[7,7,90],
	[1,1,120],
	[1,60,60],
	[7,45,45],
	[20,20,20],
]

def rankSum(distances):
	return sum(distances)

def rankMagnitude(distances):
	total = 0
	for d in distances:
		total += d**2
	# no need to square root for ranking
	return total

def rankMiddle(distances):
	total = 0
	for d in distances:
		total += d**1.5
	return total

def rank(distances, algorithm):
	res = []
	for ds in distances:
		t = algorithm(ds)
		res.append([ds, t])
	res.sort(key = lambda x: x[1])
	print(res)

def main():
	rank(distances, rankSum)
	rank(distances, rankMagnitude)
	rank(distances, rankMiddle)

if __name__ == '__main__':
	main()