#!/bin/bash

# Tries to recreate the instances used on Section 5.1.1.1. (SS-UKP) of the
# article "A hybrid algorithm for the unbounded knapsack problem"

wmins="100 500 1000 5000 10000"
wmaxs="50000 1000000"
ns="1000 2000 5000 10000"
# Generated with random.org (most close to true random numbers possible)
# 400 values, just the necessay amount for ten instances of every combination
cs=(771721 507170 700591 737429 919878 904309 546518 921854 660065 935549 555456 810134 949226 911650 731342 714179 602464 599019 676793 785219 743140 575765 884319 595758 822573 813872 889920 588624 558792 886947 692993 890345 831043 522689 548771 757113 960084 908287 759438 597881 934712 651585 930355 585253 841862 649340 786259 880033 506117 853648 755190 726618 623571 847262 751902 842723 880921 786597 820778 955846 614699 722247 565762 975126 722598 915598 702084 998133 676792 828941 544223 758616 962915 856339 714434 927298 775731 926728 907022 646208 685864 670545 584772 898184 733791 535803 997370 605365 810058 990447 896153 625437 731451 994428 829591 569112 838774 685459 972562 574685 868164 811729 833814 888331 503630 698449 915098 742667 818898 962935 676550 958150 780373 742672 817916 534895 510382 921100 614733 585653 913363 668488 624701 947511 835814 920920 897210 875688 555575 795871 514909 677154 914458 767623 538044 821634 855086 516153 816330 764660 714600 781022 663041 817500 947772 818842 927319 587849 959858 556794 967660 606409 547427 669049 717530 652960 836970 581656 641656 794611 517355 762037 671407 585275 753624 821271 819012 961618 766549 698016 712347 638572 771687 510614 677586 754733 878892 584112 821782 896939 723463 563850 898111 777991 918348 910113 579842 955831 627425 692500 835092 786199 717163 680171 811628 794434 868429 891811 640540 696928 702436 679686 717062 947405 904217 758279 582806 785630 556144 869402 801096 674749 620605 933740 680270 577917 648684 919792 621922 522084 602764 706481 962340 615523 701200 763250 866107 889537 800253 933306 508284 687899 540323 775969 598073 609067 900489 553982 905905 892278 519371 552572 669699 743993 538155 524234 724917 905112 746908 725997 854861 887154 546247 639862 980510 663957 783259 571410 677631 925301 885889 913433 766032 532726 878193 525668 829407 867650 784023 734476 746133 761697 712339 864487 755951 530892 876351 983140 506357 572196 651303 753086 529796 942575 887601 674339 982865 872546 756481 864427 988488 643267 763127 690312 779730 854260 564050 646245 733977 711726 519941 977278 747924 736513 993639 593661 554798 794863 979726 799946 605538 724816 944387 787410 528703 563354 819173 841524 972757 963193 505635 527079 938252 900235 658332 769563 662505 744409 698588 837661 735111 717370 726630 589775 803150 884660 720884 553979 603735 849580 748716 820728 558365 826338 527444 908979 745443 896171 669670 546777 524015 638567 650130 642619 927843 979382 586019 995533 500128 987402 822011 974920 898349 780916 678900 784914 511609 657882 964354 785284 854573 605138 982859 724146 924632 528906 580821 718599 775538 833361 797054 616321 634422 964288 534924 665496 523503 988452 589368 734233 564610 723320 937409 600195 833689 631507 960025 695800 881113 814865)
# the ten instances with the same wmin-wmax-n combination aren't 
# supposed to have the same items, even if the capacity is
# different. Generated with random.org, values between 0 and
# 10^9 (one billion, the max allowed by random.org)
seeds=(827183242 843367405 528806317 780179313 721215008 110877071 227708629 177710744 991580855 126456688)

for wmin in $wmins; do
	for wmax in $wmaxs; do
		for n in $ns; do
			for i in `seq 0 9`; do
				pyasukp -nosolve -form ss -save "wmin${wmin}wmax${wmax}n${n}-${i}-s${seeds[i]}c${cs[$counter]}" -seed ${seeds[$i]} -cap ${cs[$counter]} -wmin $wmin -wmax $wmax -n $n
				counter=$counter+1
			done
		done
	done
done
