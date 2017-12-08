function video_path = get_benchmark_path(bench_name)

switch bench_name
    case 'vot15'
        video_path = 'E:\dataset\VOT2015';
    case 'vot14'
        video_path = 'E:\dataset\VOT2014';
    case 'vot13'
        video_path = 'E:\dataset\VOT2013';
    case 'DAVIS_2017_train'
	video_path = '/home/wenjian/ADNet/data/DAVIS-2017-trainval-480p/JPEGImages/480p';
end
