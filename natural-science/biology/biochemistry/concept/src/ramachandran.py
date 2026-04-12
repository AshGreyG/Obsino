from ramachandraw.utils import fetch_pdb, plot

def main():
    pdb_id = "1ca2"
    plot(fetch_pdb(pdb_id))

if __name__ == "__main__":
    main()
