import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/data_sources/book_remote_date_source.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl extends BookRepository{
  BookRemoteDateSource _bookRemoteDateSource = BookRemoteDateSource(ApiService()) ; 
  @override
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks() {
   
 return _bookRemoteDateSource.fetchFeaturedBooks() ; 
  }

  @override
  Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks() {
 
   return _bookRemoteDateSource.fetchBestSellerBooks() ; 
  }

}